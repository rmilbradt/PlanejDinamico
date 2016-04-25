package br.ufsm.ceesp.model;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by politecnico on 22/04/2016.
 */
@Entity
@Table(name = "ORDENS_SERVICO")
public class OrdemServico {

    private Long id;
    private Rota rota;
    private Long numero;
    private Integer sequencia;
    private String tipo;
    private Localizacao localizacao;
    private Date dataHoraChegada;
    private Date dataHoraSaida;
    private Integer prioridade;
    private Integer tempoAcumulado;

    @Id
    @GeneratedValue
    @Column(name = "ID")
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Column(name = "NUMERO")
    public Long getNumero() {
        return numero;
    }

    public void setNumero(Long numero) {
        this.numero = numero;
    }

    @Column(name = "SEQUENCIA")
    public Integer getSequencia() {
        return sequencia;
    }

    public void setSequencia(Integer sequencia) {
        this.sequencia = sequencia;
    }

    @Column(name = "TIPO")
    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    @Embedded
    public Localizacao getLocalizacao() {
        return localizacao;
    }

    public void setLocalizacao(Localizacao localizacao) {
        this.localizacao = localizacao;
    }

    @Column(name = "DATAHORA_CHEGADA")
    public Date getDataHoraChegada() {
        return dataHoraChegada;
    }

    public void setDataHoraChegada(Date dataHoraChegada) {
        this.dataHoraChegada = dataHoraChegada;
    }

    @Column(name = "DATAHORA_SAIDA")
    public Date getDataHoraSaida() {
        return dataHoraSaida;
    }

    public void setDataHoraSaida(Date dataHoraSaida) {
        this.dataHoraSaida = dataHoraSaida;
    }

    @Column(name = "PRIORIDADE")
    public Integer getPrioridade() {
        return prioridade;
    }

    public void setPrioridade(Integer prioridade) {
        this.prioridade = prioridade;
    }

    @Column(name = "TEMPO_ACUMULADO")
    public Integer getTempoAcumulado() {
        return tempoAcumulado;
    }

    public void setTempoAcumulado(Integer tempoAcumulado) {
        this.tempoAcumulado = tempoAcumulado;
    }

    @ManyToOne
    @JoinColumn(name = "ID_ROTA")
    public Rota getRota() {
        return rota;
    }

    public void setRota(Rota rota) {
        this.rota = rota;
    }
}
