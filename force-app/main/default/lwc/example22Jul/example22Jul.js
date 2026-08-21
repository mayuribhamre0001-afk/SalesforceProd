import { LightningElement } from 'lwc';

export default class Example22Jul extends LightningElement 
{
    name = 'Mayuri';
    sirname = 'Bhamre';
    city = 'Pune';
    onButtonClick()
    {
        this.name = 'Akshay';
        this.sirname = 'Kumar';
        this.city = 'Mumbai'
    }
}