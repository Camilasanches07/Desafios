N’oublie pas d’exécuter les commandes antérieures 👆

**IMPORTANT** 👇

Copie le code d’hier :

```bash
cp -r ../../05-Food-Delivery-Day-One/01-Food-Delivery/{app,data,app.rb,router.rb} . # le point à la fin est important
```

Avant de commencer, vérifie que tout fonctionne encore en lançant ton
app :

```bash
ruby app.rb
```

Puis exécute :

```bash
rake
```

Maintenant, reprends ton code et continue d’ajouter des fonctionnalités
au routeur / en veillant à ce que `rake` reste en vert.

Continue d’ajouter des fonctionnalités à ton programme de livraison
d’aliments !

Voici toutes les **actions utilisateur** de l’application :
[ ] En tant qu’employé·e, je peux me connecter
[X] En tant que responsable, je peux ajouter un nouveau repas
[X] En tant que responsable, je peux faire une liste de tous les repas
[X] En tant que responsable, je peux ajouter un·e nouveau/elle client·e
[X] En tant que responsable, je peux faire une liste de tou·te·s les client·e·s
[ ] En tant que responsable, je peux ajouter une nouvelle commande
[ ] En tant que responsable, je peux faire une liste de toutes les commandes non livrées
[ ] En tant que livreur·se, je peux marquer l’une de mes commandes comme livrée
[ ] En tant que livreur·se, je peux faire une liste de toutes mes commandes non livrées

Il y a donc deux nouveaux composants :
- **Employé·e·s**
- **Commandes**

## 1 - `Employee`

### 1.1 - Modèle `Employee`

Le restaurant a deux types d’employé·e·s, les **responsables** et les
**livreurs·ses**. Les deux ont un id, un nom d’utilisateur et un mot de
passe, mais ils ont différents privilèges liés à leur rôle.

Écris du code pour implémenter cela et teste ton modèle dans `irb`.
Teste ensuite ton code en exécutant `rake employee`.

Tout est en vert ? Parfait ! Le moment est venu de faire `git add`,
`commit` et `push`.

### 1.2 - Repository `Employee`

Maintenant que tu as un modèle pour représenter les employé·e·s, tu as
besoin d’un repository pour les stocker.

Ce repository s’initialise avec un chemin de fichier CSV. Il fonctionne
en **lecture seule**, car seul·e l’administrateur·rice de l’app peut
créer des comptes (inutile de créer une méthode `add`). L’interface de
ce repository permet de :
- récupérer tou·te·s les livreurs·ses du repository
- trouver un·e employé·e spécifique grâce à son id
- trouver un·e employé·e spécifique grâce à son nom d’utilisateur.

Écris du code pour implémenter cela et teste ton repository dans `irb`.
Tu dois créer ton propre fichier CSV `employees.csv` dans le dossier
`data`. Teste ensuite ton code en exécutant `rake employee`.

Tout est en vert ? Parfait ! Le moment est venu de faire `git add`,
`commit` et `push`.

### 1.3 - Contrôleur de session (`Session`)

On va maintenant implémenter une logique de **connexion** dans
l’application.

On veut qu’il y ait deux menus dans le routeur : un contenant les tâches
des responsables, l’autre contenant les tâches des livreurs·ses. On veut
aussi router le choix de l’employé·e vers l’action correspondante du
contrôleur correspondant.

Pour cela, on va introduire la notion de **session**. Au niveau du
routeur, on va stocker l’utilisateur·rice connecté·e à une session.

La séquence de connexion doit ressembler à ceci :

```bash
> username?
paul
> password?
blablabla
Wrong credentials... Try again!
> username?
paul
> password?
secret
Welcome Paul!
```

Une fois la connexion établie, le tableau de bord qui s’affiche doit
**dépendre du rôle**.

Écris du code pour implémenter ce comportement.

Il n’y a pas de rake pour cette partie. Lance ton application et exécute
cette commande dans le terminal :

```bash
ruby app.rb
```

Tout fonctionne correctement ? Parfait ! Le moment est venu de faire
`git add`, `commit` et `push`.

## 2 - `Order`

### 2.1 - Modèle de commande (`Order`)

Le restaurant prend des commandes ; tu dois donc trouver une façon de
représenter ce qu’est une commande.

Une commande est ce qui lie tout ensemble. Chaque commande a une id, un
repas, un·e client·e, un·e employé·e et un booléen `delivered` pour
indiquer si la commande a été livrée ou non.

Écris du code pour implémenter cela et teste ton modèle dans `irb`.
Teste ensuite ton code en exécutant `rake order`.

Tout est en vert ? Parfait ! Le moment est venu de faire `git add`,
`commit` et `push`.

### 2.2 - Repository `Order`

Maintenant que tu as un modèle pour représenter les commandes, tu as
besoin d’un repository pour les stocker.

Ce repository s’initialise avec un chemin de fichier CSV. Il lit/écrit
les commandes depuis le fichier CSV et les garde en mémoire. L’interface
de ce repository permet de :
- créer une nouvelle commande
- récupérer toutes les commandes non livrées

Puisqu’une commande a des **instances** `meal`, `customer` et
`employee`, on doit également initialiser notre repository de commandes
avec un repository de repas, un repository de client·e·s et un
repository d’employé·e·s.

Écris du code pour implémenter cela et teste ton repository dans `irb`.
Tu dois créer ton propre fichier CSV `orders.csv` dans le dossier
`data`. Teste ensuite ton code en exécutant `rake order`.

**Important** : Les tests
`rake` sur `order_repository` **fonctionnent uniquement si tu définis les paramètres dans `#initialize` dans le même ordre que dans les tests** :

``` ruby
class OrderRepository
 def initialize(orders_csv_path, meal_repository, customer_repository, employee_repository)
    # [...]
 end

  # [...]
end
```

Tout est en vert ? Parfait ! Le moment est venu de faire `git add`,
`commit` et `push`.

### 2.3 - Contrôleur `Order`

On va passer au contrôleur. Voici les **actions utilisateur** qu’on veut
implémenter :
- En tant que responsable, je peux ajouter une nouvelle commande
- En tant que responsable, je peux faire la liste de toutes les commandes non livrées
- En tant que livreur·se, je peux marquer l’une de mes commandes comme livrée
- En tant que livreur·se, je peux faire la liste de toutes mes commandes non livrées

Souviens-toi que le rôle du contrôleur est de déléguer le travail aux
autres composants de l’app (modèle, repository et vues) !

Commence par écrire le **pseudocode**, en distinguant les étapes
élémentaires de chaque action utilisateur et en déléguant chaque étape à
un composant (modèle, repository ou vue). Puis écris le code pour
implémenter chaque étape. Crée et code-la étape par étape.

Pour tester ton contrôleur, connecte-le à ton app en l’instanciant dans
`app.rb` et en le passant au routeur. Tu peux ensuite tester ton code en
lançant ton app :

```bash
ruby app.rb
```

`rake order` doit également être utile pendant ces étapes. Suis ton
guide !

Vérifie que les quatre actions utilisateur des commandes fonctionnent
avant de passer à la fonction suivante.

**Important** : Les tests
`rake` sur `orders_controller` **fonctionnent uniquement si tu définis les paramètres dans `#initialize` dans le même ordre que dans les tests** :

``` ruby
class OrdersController
 def initialize(meal_repository, customer_repository, employee_repository, order_repository)
    # [...]
 end

  # [...]
end
```

**Important** : Dans la mesure où les **id** ne commencent pas forcément
à 1 et ne se suivent pas nécessairement, on va plutôt demander des
**index** à l’utilisateur·rice pour améliorer l’expérience.

Tout est en vert ? Parfait ! Le moment est venu de faire `git add`,
`commit` et `push`.

## 3 - Facultatif

### 3.1 - Implémenter les actions `edit` et `destroy` pour les commandes

Dans l’application, un·e responsable ne peut pas modifier ou supprimer
une commande existante.

Implémente ces actions utilisateurs complémentaires :
- En tant que responsable, je peux modifier une commande existante
- En tant que responsable, je peux supprimer une commande existante

C’est bon ? Le moment est venu de faire `git add`, `commit` et `push`.

### 3.2 - Masquer le mot de passe de l’utilisateur·rice

Pour le moment, le mot de passe de l’utilisateur·rice est stocké
directement dans le CSV et visible de tous. Est-ce une bonne idée ? Que
pourrait-on faire à la place ?

C’est bon ? Le moment est venu de faire `git add`, `commit` et `push`.

Tu as terminé l’exercice !
