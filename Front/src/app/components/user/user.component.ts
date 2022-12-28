import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ToastService } from 'src/app/services/toast.service';
import { UserService } from '../../services/user.service';



@Component({
  selector: 'app-user',
  templateUrl: './user.component.html',
  styleUrls: ['./user.component.css']
})
export class UserComponent implements OnInit {

  userForm : FormGroup;
  error : boolean = false;

  constructor(private fb : FormBuilder,
              private userService : UserService,
              private toastService : ToastService) {
    this.userForm = fb.group({
      name        : ['',Validators.required],
      lastName    : ['',Validators.required],
      email       : ['',[Validators.required, Validators.email]],
      birthDate   : ['',Validators.required],
      phoneNumber : ['', [Validators.minLength(10), Validators.maxLength(11)]],
      country     : ['',[Validators.required, Validators.minLength(3), Validators.maxLength(3)]],
      contact     : [false,Validators.required]
    });
   }

  ngOnInit(): void {
  }


  goBack(){
    window.history.back();
  }

  onSubmit(){        
    this.error = false;

    if(this.userForm.invalid){      
      this.toastService.show("Completá todos los campos necesarios", { classname: 'bg-danger text-light', delay: 15000 }); 
      this.error = true;     
      return;
    }
    
    this.userService.postUser(this.userForm.value).subscribe(
      data => {
        this.toastService.show("Usuario dado de alta con éxito", { classname: 'bg-success text-light', delay: 15000 });        
        setTimeout(() => {
          window.history.back();  
        }, 5000);


      },
      error => {        
        this.toastService.show(error.error, { classname: 'bg-danger text-light', delay: 15000 });      
      }//showMessage
    )
    ;


  }


}
