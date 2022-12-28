export interface IUser {
    nombre          : string;
    apellido        : string;
    email           : string;
    pais            : string;
    fechaNacimiento : Date;
    telefono        : number;
    deseaContacto   : boolean;
}


export class User implements IUser {
    nombre          : string;
    apellido        : string;
    email           : string;
    pais            : string;
    fechaNacimiento : Date;
    telefono        : number;
    deseaContacto   : boolean;

    /**
     *
     */
    constructor(obj : any) {        
        this.nombre          = obj.name
        this.apellido        = obj.lastName
        this.email           = obj.email
        this.pais            = obj.country
        this.fechaNacimiento = obj.birthDate
        this.telefono        = obj.phoneNumber
        this.deseaContacto   = obj.contact
    }


}