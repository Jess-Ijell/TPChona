// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
 
contract estudiante{
    string private _nombre;
    string private _apellido;
    string private _curso;
    address private _docente;
    mapping(string => uint) private _notas_materias;
    string[] private materias;
 
    constructor(string memory nombre_, string memory apellido_, string memory curso_){
        _nombre = nombre_;
        _apellido = apellido_;
        _curso = curso_;
        _docente = msg.sender;
    }
 
    function apellido() public view returns (string memory){
        return _apellido;
    }
 
    function nombre_completo() public view returns (string memory){
        return string.concat(_nombre, _apellido);        
    }
 
    function curso() public view returns (string memory){
        return _curso;
    }    
 
    function set_nota_materia(string memory materia, uint nota) public{
        require(msg.sender == _docente, "Solo el docente puede establecer las notas.");
        _notas_materias[materia] = nota;        
        materias.push(materia);
    }
 
    function nota_materia(string memory materia) public view returns (uint){
        return _notas_materias[materia];
    }
 
    function aprobo(string memory materia) public view returns (bool){      
        if (_notas_materias[materia] >= 60){
            return true;
        }
 
        else{
            return false;
        }
    }
 
    function promedio() public view returns (uint){
        uint notas;
        uint division = 0;
 
        for (uint i; i <= materias.length; i++){
            notas += _notas_materias[materias[i]];
            division++;                      
        }
 
        return notas/division;
    }
}