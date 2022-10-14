Plano de ação:

Passo 1. Verificar como a requisição está sendo feita no front ao enviar o formulário

	A requisição ao servidor parece estar sendo enviada somente uma vez ao preencher o formulário

Passo 2. identificar a rota no back-end 

	A rota correspondente ao preenchimento deste formulário no back-end é a /enrollments e o método POST é o responsável por criar uma nova inscrição ou editar uma já existente 

Passo 3. Percorrer desde o controller ao repository correspondente.

	O método utilizado para criar ou atualizar uma linha na tabela enrollments é o upsert. Conforme a documentação do prisma, esse método requer que seja passada uma propriedade where, create e update. 
	Além disso, também está sendo passada a ação create dentro da propriedade Address

Passo 4. Simular uma adição de info para verificar se ocorre o erro

	Foi encontrada uma potencial falha na inserção/atualização dos dados na base. O método create não verifica se o endereço já existia anteriormente. 
	Ao simular a adição da informação, realmente, apenas a tabela dos endereços tem valores duplicados.
	


RESOLUÇÃO

	O problema foi sanado com 3 ações:

	- A ação create dentro do Address foi modificada para connectOrCreate, para criar um novo endereço apenas quando ele não existe.
	
	- Para ser possível atualizar informações novas em endereços existentes, foi criada uma nova query update específica para a tabela endereços.
	
	- Por garantia, foi adicionada uma limitação (constraint) na tabela de endereços, de forma que não é possível criar um novo endereço que possua o mesmo conjunto de cep, endereço e número.
