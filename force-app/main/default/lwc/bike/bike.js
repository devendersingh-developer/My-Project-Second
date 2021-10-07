import { LightningElement,api  } from 'lwc';

export default class Bike extends LightningElement {
@api bike;
contacts=[
{
Id :'00076262838238236',
Name: 'Devender Singh',
Title: 'Software developer'
},{
    Id :'00076262838238237',
    Name: 'Anjali Singh',
    Title: 'Software developer'
},{
    Id :'00076262838238238',
    Name: 'Ghanika Singh',
    Title: 'Software developer'
},{
    Id :'00076262838238239',
    Name: 'Advik Singh',
    Title: 'Software developer'
}
];
}