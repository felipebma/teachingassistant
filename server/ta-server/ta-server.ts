import express = require('express');
import bodyParser = require("body-parser");

import {Aluno} from '../../gui/ta-gui/src/app/aluno';
import {CadastroDeAlunos} from './cadastrodealunos';

var app = express();

var cadastro: CadastroDeAlunos = new CadastroDeAlunos();

var allowCrossDomain = function(req: any, res: any, next: any) {
    res.header('Access-Control-Allow-Origin', "*");
    res.header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE');
    res.header('Access-Control-Allow-Headers', 'Content-Type');
    next();
}
app.use(allowCrossDomain);

app.use(bodyParser.json());

app.get('/alunos', function (req, res) {
  res.send(JSON.stringify(cadastro.getAlunos()));
  console.log("get foi chamado");
})

app.post('/aluno', function (req: express.Request, res: express.Response) {
  var aluno: Aluno = <Aluno> req.body; //verificar se é mesmo Aluno!
  aluno = cadastro.criar(aluno);
  if (aluno) {
    res.send({"success": "O aluno foi cadastrado com sucesso"});
  } else {
    res.send({"failure": "O aluno não pode ser cadastrado"});
  }
})

app.put('/aluno', function (req: express.Request, res: express.Response) {
  var aluno: Aluno = <Aluno> req.body;
  aluno = cadastro.atualizar(aluno);
  if (aluno) {
    res.send({"success": "O aluno foi atualizado com sucesso"});
  } else {
    res.send({"failure": "O aluno não pode ser atualizado"});
  }
})

app.delete('/aluno/:cpf', function (req: express.Request, res: express.Response) {
  var aluno = cadastro.remover(req.params.cpf);
  if (aluno) {
    res.send({"success": "O aluno foi removido com sucesso"});
  } else {
    res.send({"failure": "O aluno não foi encontrado"});
  }
})

app.get('/checkCPF', function (req: express.Request, res: express.Response) {
  var aluno: Aluno = <Aluno> req.body;
  var exists: boolean;
  exists = !cadastro.cpfNaoCadastrado(aluno.cpf);
  if(exists){ 
    res.send(aluno);
  }else{
    res.send(null);
  }
  
})


app.listen(3000, function () {
  console.log('Example app listening on port 3000!')
})

export { app }