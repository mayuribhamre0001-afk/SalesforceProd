import { LightningElement, wire, track } from 'lwc';
import getFlights from '@salesforce/apex/TicketBooking.getFlights';
import getBookedSeats from '@salesforce/apex/TicketBooking.getBookedSeats';
import bookSeat from '@salesforce/apex/TicketBooking.bookSeat';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class HelloWorld extends LightningElement 
{
    @track flightOptions = [];
    @track selectedFlightId;
    @track selectedFlight;
    @track bookedSeats = [];
    customerName = '';
    seatNumber = '';

    @wire(getFlights)
    wiredFlights({ data, error }) {
        if (data) {
            this.flightOptions = data.map(f => ({
                label: f.Flight_Name__c,
                value: f.Id
            }));
        } else if (error) {
            console.error(error);
        }
    }

    get remainingSeats() {
        if (this.selectedFlight && this.selectedFlight.Total_Seats__c) {
            return this.selectedFlight.Total_Seats__c - this.bookedSeats.length;
        }
        return 0;
    }

    async handleFlightChange(event) {
        this.selectedFlightId = event.detail.value;
        this.selectedFlight = this.flightOptions.find(f => f.value === this.selectedFlightId);
        await this.fetchBookedSeats();
    }

    async fetchBookedSeats() {
        try {
            const result = await getBookedSeats({ flightId: this.selectedFlightId });
            this.bookedSeats = result;
        } catch (error) {
            console.error(error);
        }
    }

    handleNameChange(event) {
        this.customerName = event.detail.value;
    }

    handleSeatChange(event) {
        this.seatNumber = event.detail.value;
    }

    async handleBookSeat() {
        try {
            await bookSeat({
                flightId: this.selectedFlightId,
                customerName: this.customerName,
                seatNumber: parseInt(this.seatNumber, 10)
            });

            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Success',
                    message: 'Seat booked successfully!',
                    variant: 'success'
                })
            );

            this.customerName = '';
            this.seatNumber = '';
            await this.fetchBookedSeats();
        } catch (error) {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error',
                    message: 'Failed to book seat.',
                    variant: 'error'
                })
            );
            console.error(error);
        }
    }
}