# DataSourceJSON
                        DESENVOLVIMENTO RODRIGO RAFAEL
                        DATA ULTIMA ATUALIZAÇÃO 20/04/2023
                        PROJETO OPEN SOURCE;

                    Copyright [2023] [name of copyright owner]

                    Licensed under the Apache License, Version 2.0 (the "License");
                    you may not use this file except in compliance with the License.
                    You may obtain a copy of the License at

                        http://www.apache.org/licenses/LICENSE-2.0

                    Unless required by applicable law or agreed to in writing, software
                    distributed under the License is distributed on an "AS IS" BASIS,
                    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
                    See the License for the specific language governing permissions and
                    limitations under the License.

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
}   
