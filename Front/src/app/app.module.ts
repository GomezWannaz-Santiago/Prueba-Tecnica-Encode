import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { UserComponent } from './components/user/user.component';
import { UserHistoryComponent } from './components/user-history/user-history.component';
import { LandingPageComponent } from './components/landing-page/landing-page.component';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { NavbarComponent } from './components/navbar/navbar.component';
import { ReactiveFormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { ToastsContainer } from './components/toast-global/toast-container.component';
import { NgbdToastGlobal } from './components/toast-global/toast-global.component';
import { DatePipe } from '@angular/common';

@NgModule({
  declarations: [
    AppComponent,
    UserComponent,
    UserHistoryComponent,
    LandingPageComponent,
    NavbarComponent,    
        
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    NgbModule,
    ReactiveFormsModule, 
    HttpClientModule,     
    NgbdToastGlobal,
    ToastsContainer
  ],
  providers: [DatePipe],
  bootstrap: [AppComponent]
})
export class AppModule { }
