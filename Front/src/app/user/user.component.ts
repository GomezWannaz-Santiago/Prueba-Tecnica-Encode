import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'app-user',
  templateUrl: './user.component.html',
  styleUrls: ['./user.component.css']
})
export class UserComponent implements OnInit {

  userForm : FormGroup;


  constructor(private fb : FormBuilder) {
    this.userForm = fb.group({
      name        : ['',Validators.required],
      lastName    : ['',Validators.required],
      email       : ['',Validators.required],
      birthDate   : ['',Validators.required],
      phoneNumber : [''],
      country     : ['',Validators.required],
      contact     : [false,Validators.required]
    })


   }

  ngOnInit(): void {
  }


  goBack(){
    window.history.back();
  }

  onSubmit(){
    debugger;
    if(this.userForm.invalid){

      //showMessage




      return;
    }

    this.userForm.value;
  }


}
