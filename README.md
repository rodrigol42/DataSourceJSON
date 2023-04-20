# DataSourceJSON
                        DESENVOLVIMENTO RODRIGO RAFAEL
                        DATA ULTIMA ATUALIZAÇÃO 20/04/2023
                        PROJETO OPEN SOURCE;
                        
                        
                        
                        
                    O intuito do componente é fazer com que pegue arquivos .json e coloque diretamente em uma grid 
                    projeto 100% simples e com Biblioteca nativas do lazarus 
                        

                    só é aceito OBJETO JSON BASICO SEGUE EXEMPLO ABAIXO

                    {
                      "Author ID":"409-56-7008",
                      "Last Name":"Bennet",
                      "First Name":"Abraham",
                      "Active": "False"
                    }
                    Atenção não o defina como um objeto array o componente já faz esse procedimento
                    exemplo
                    [
                    {
                      "Author ID":"409-56-7008",
                      "Last Name":"Bennet",
                      "First Name":"Abraham",
                      "Active": "False"
                    }
                    ]
                    caso queira ter mais registros dentro de uma grid o objeto json deve ser
                    {
                      "Author ID":"409-56-7008",
                      "Last Name":"Bennet",
                      "First Name":"Abraham",
                      "Active": "False"
                    },
                    {
                      "Author ID":"409-56-7008",
                      "Last Name":"Bennet",
                      "First Name":"Abraham",
                      "Active": "False"
                    }
                    com isso será modelado mais valores dentro de uma grid
                    
                    
-----------------------EXEMPLO DE ULTILIZAÇÃO DO COMPONENTE--------------------

procedure TForm1.Button1Click(Sender: TObject);
var
  VComponent : TJSONSource;
begin      
  VComponent := TJSONSource.Create(nil)  
  VComponent.LocalArquivo := 'C:\arquivo.json';
  VComponent.Ativa:= True;
  DBGrid1.DataSource:=VComponent;
end;

-------------------------------------------------------------------------------
                    
                        
}   




