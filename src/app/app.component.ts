import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title: String = "Esta es Mi Primer CRUD APP En Angular";

  empleados = [

    {'id': 'Diego',position: 'Programador'},
    {'id': 'Mauricio',position: 'Ingeniero'},
    {'id': 'Sandra',position: 'Ingeniera'},
    {'id': 'Oscar',position: 'Mecanico'}
] ; // fin array 

model : any = { };

addEmployed() :void {

  
}// FinAgregar

DeleteEmployed () : void {



} // FinEliminar

editEmployed (): void {


} // fin editar

UpdateEmployed () : void {


}// fin altualizar 
 






}// fin class 
