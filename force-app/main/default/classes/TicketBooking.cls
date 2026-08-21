public with sharing class TicketBooking {

    @AuraEnabled(cacheable=true)
    public static List<Flight_Schedule__c> getFlights() 
    {
        return [
            SELECT Id, Name, Flight_Name__c, Total_Seats__c, Seats_Booked__c
            FROM Flight_Schedule__c
            ORDER BY Flight_Name__c
        ];
    }

    @AuraEnabled(cacheable=true)
    public static List<Ticket__c> getBookedSeats(Id flightId) {
        return [
            SELECT Id, Seat_Number__c, Status__c
            FROM Ticket__c
            WHERE Flight__c = :flightId AND Status__c = 'Booked'
        ];
    }

    @AuraEnabled
    public static void bookSeat(Id flightId, String customerName, Integer seatNumber) {
        // Create ticket
        Ticket__c t = new Ticket__c(
            Flight__c = flightId,
            Name = customerName,
            Seat_Number__c = seatNumber,
            Status__c = 'Booked'
        );
        insert t;

        // Update flight seat count
        Flight_Schedule__c f = [SELECT Id, Seats_Booked__c FROM Flight_Schedule__c WHERE Id = :flightId];
        f.Seats_Booked__c = (f.Seats_Booked__c == null ? 1 : f.Seats_Booked__c + 1);
        update f;
    }
}