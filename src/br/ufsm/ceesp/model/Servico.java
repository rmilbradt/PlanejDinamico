package br.ufsm.ceesp.model;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by politecnico on 02/03/2016.
 */
@Entity
@Table(name = "SERVICO")
public class Servico {

    private Long id;
    private Date dataRealizacao;
    private Localizacao localizacao;
    private Integer tempoExecucao;
    private String descricaoServico;

    @Id
    @GeneratedValue
    @Column(name = "ID")
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Column(name="DATA_REALIZACAO")
    public Date getDataRealizacao() {
        return dataRealizacao;
    }

    public void setDataRealizacao(Date dataRealizacao) {
        this.dataRealizacao = dataRealizacao;
    }

    @Embedded
    public Localizacao getLocalizacao() {
        return localizacao;
    }

    public void setLocalizacao(Localizacao localizacao) {
        this.localizacao = localizacao;
    }

    @Column(name="TEMPO_EXECUCAO")
    public Integer getTempoExecucao() {
        return tempoExecucao;
    }

    public void setTempoExecucao(Integer tempoExecucao) {
        this.tempoExecucao = tempoExecucao;
    }

    @Column(name="DESCRICAO_SERVICO")
    public String getDescricaoServico() {
        return descricaoServico;
    }

    public void setDescricaoServico(String descricaoServico) {
        this.descricaoServico = descricaoServico;
    }
}
