class Nota {

    constructor(nId, nDescripcion){
        this.id=nId;
        this.descripcion=nDescripcion;
    }

    obtenerDescripcionNota(){

        return this.descripcion
    }

    obtenerIDNota(){

        return this.id
    }

    editarDescripcion(nDescripcion){
        this.descripcion=nDescripcion;
    }
}