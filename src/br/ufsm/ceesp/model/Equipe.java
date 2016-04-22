package br.ufsm.ceesp.model;

import javax.persistence.*;

/**
 * Created by politecnico on 22/04/2016.
 */
@Entity
@Table(name = "EQUIPES")
public class Equipe {

    private Long id;
    private Long numero;
    private Localizacao localizacao;
    private Long tempoAcumulado;

    @Id
    @GeneratedValue
    @Column(name = "ID")
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Column(name = "NUMERO", unique = true)
    public Long getNumero() {
        return numero;
    }

    public void setNumero(Long numero) {
        this.numero = numero;
    }

    @Embedded
    public Localizacao getLocalizacao() {
        return localizacao;
    }

    public void setLocalizacao(Localizacao localizacao) {
        this.localizacao = localizacao;
    }

    @Column(name = "TEMPO_ACUMULADO")
    public Long getTempoAcumulado() {
        return tempoAcumulado;
    }

    public void setTempoAcumulado(Long tempoAcumulado) {
        this.tempoAcumulado = tempoAcumulado;
    }
}
