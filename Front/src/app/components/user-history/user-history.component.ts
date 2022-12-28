import { Component, OnInit } from '@angular/core';
import { IHistory } from 'src/app/models/history.model';
import { UserService } from '../../services/user.service';
import { DatePipe } from '@angular/common';

@Component({
  selector: 'app-user-history',
  templateUrl: './user-history.component.html',
  styleUrls: ['./user-history.component.css']
})
export class UserHistoryComponent implements OnInit {

  activities : any[] = []

  constructor(private userService : UserService, private datePipe : DatePipe) { }

  ngOnInit(): void {
    this.userService.getHistory().subscribe((data : IHistory[]) => {
      data.forEach(x=> {
        let fecha = this.datePipe.transform(x.fechaCreacion, 'dd/MM/yyyy hh:mm');
        x.fechaFormateada = fecha ? fecha : "";
      });
      this.activities = data;
    })

  }



}
