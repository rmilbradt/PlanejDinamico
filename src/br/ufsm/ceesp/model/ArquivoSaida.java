package br.ufsm.ceesp.model;

import javax.persistence.*;
import java.util.Collection;
import java.util.Date;

/**
 * Created by politecnico on 22/04/2016.
 */
@Entity
@Table(name = "ARQUIVO_SAIDA")
public class ArquivoSaida {

    private Long id;
    private Date data;
    private Integer numEquipes;
    private Integer numOrdensEmergenciaisNaoAtribuidas;
    private String equacao;
    private Collection<Rota> rotas;

    @OneToMany(mappedBy = "arquivoSaida")
    public Collection<Rota> getRotas() {
        return rotas;
    }

    public void setRotas(Collection<Rota> rotas) {
        this.rotas = rotas;
    }

    @Id
    @GeneratedValue
    @Column(name = "ID")
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Column(name = "DATA")
    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    @Column(name = "NUM_EQUIPES")
    public Integer getNumEquipes() {
        return numEquipes;
    }

    public void setNumEquipes(Integer numEquipes) {
        this.numEquipes = numEquipes;
    }

    @Column(name = "NUM_ORDENS_EMERGENCIAIS_NAO_ATRIBUIDAS")
    public Integer getNumOrdensEmergenciaisNaoAtribuidas() {
        return numOrdensEmergenciaisNaoAtribuidas;
    }

    public void setNumOrdensEmergenciaisNaoAtribuidas(Integer numOrdensEmergenciaisNaoAtribuidas) {
        this.numOrdensEmergenciaisNaoAtribuidas = numOrdensEmergenciaisNaoAtribuidas;
    }

    @Column(name = "EQUACAO")
    public String getEquacao() {
        return equacao;
    }

    public void setEquacao(String equacao) {
        this.equacao = equacao;
    }
}
