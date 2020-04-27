//upload de l'image si image envoyée via le formulaire
		if(!empty($_FILES['image']['name'])){
			
			//tableau des extentions que l'on accepte d'uploader
			$allowed_extensions = array( 'jpg' , 'jpeg' , 'gif', 'png' );
			//extension du fichier envoyé via le formulaire
			$my_file_extension = pathinfo( $_FILES['image']['name'] , PATHINFO_EXTENSION);

			//si l'extension du fichier envoyé est présente dans le tableau des extensions acceptées
			if ( in_array($my_file_extension , $allowed_extensions) ){

				//je génrère une chaîne de caractères aléatoires qui servira de nom de fichier
				//le but étant de ne pas écraser un éventuel fichier ayant le même nom déjà sur le serveur
				$new_file_name = md5(     rand()    ) . '.' . $my_file_extension ;
				
				//donne pour exemple : 29992a10a1911243ffa69396ab41e97d.jpg
				//ici, il est possible de vérifier si le fichier 29992a10a1911243ffa69396ab41e97d.jpg
				//utiliser la fonction file_exists en PHP pour tester si ce fichier existe déjà dans le dossier visé

				//destination du fichier sur le serveur (chemin + nom complet du fichier)
				$destination = '../img/article/' . $new_file_name;

				//déplacement du fichier à partir du dossier temporaire du serveur vers sa destination
				$result = move_uploaded_file( $_FILES['image']['tmp_name'], $destination);
				
				//mise à jour de l'article enregistré ci-dessus avec le nom du fichier image qui lui sera associé
				$query = $db->prepare('UPDATE article SET
					image = :image
					WHERE id = :id'
				);

				$resultUpdateImage = $query->execute(
					[
						'image' => $new_file_name,
						'id' => $lastInsertedArticleId
					]
				);
			}
		}