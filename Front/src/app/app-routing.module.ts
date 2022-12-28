import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AppComponent } from './app.component';
import { LandingPageComponent } from './components/landing-page/landing-page.component';
import { UserHistoryComponent } from './components/user-history/user-history.component';
import { UserComponent } from './components/user/user.component';

const routes: Routes = [  
  {path:'register', component:UserComponent, pathMatch:'full'},
  {path:'history', component:UserHistoryComponent, pathMatch:'full'},
  { path:'' , component:LandingPageComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
