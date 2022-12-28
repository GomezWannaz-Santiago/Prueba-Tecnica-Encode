import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from 'src/environments/environment';
import { Observable } from 'rxjs';
import { IUser, User } from '../models/user.model';
import { IHistory } from '../models/history.model';

@Injectable({
  providedIn: 'root'
})
export class UserService {

  private readonly url : string = environment.apiURL;

  constructor(private http : HttpClient) { }

  getUsers() : Observable<IUser[]>{
    return this.http.get<IUser[]>(this.url + '/user');
  }

  postUser(user : any){
    let sentUser = new User(user);
    return this.http.post<IUser>(this.url + '/user', sentUser);
  }

  getHistory() : Observable<IHistory[]>{
    return this.http.get<IHistory[]>(this.url + '/history');
  }





}
