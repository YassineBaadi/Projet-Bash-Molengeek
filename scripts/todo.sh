#!/bin/bash

# Fichier stocker les tâches
tasks_file="tasks.txt"

# Fonction afficher le menu
afficher_menu() {
    echo "\n===== MENU ====="
    echo "1) Ajouter une tâche"
    echo "2) Supprimer une tâche"
    echo "3) Afficher les tâches"
    echo "4) Quitter"
    echo -n "Votre choix : "
}

# Fonction ajouter une tâche
ajouter_tache() {
    echo -n "Entrez une nouvelle tâche : "
    read task
    echo "$task" >> "$tasks_file"
    echo "Tâche ajoutée !"
}

# Fonction supprimer une tâche
supprimer_tache() {
    if [ ! -s "$tasks_file" ]; then
        echo "Aucune tâche à supprimer."
    else
        echo "Voici vos tâches :"
        cat -n "$tasks_file"
        echo -n "Entrez le numéro de la tâche à supprimer : "
        read task_num
        sed -i "${task_num}d" "$tasks_file"
        echo "Tâche supprimée !"
    fi
}

# Fonction afficher les tâches
afficher_taches() {
    if [ ! -s "$tasks_file" ]; then
        echo "Aucune tâche enregistrée."
    else
        echo "Vos tâches :"
        cat -n "$tasks_file"
    fi
}

# Boucle menu principal
echo "Bienvenue dans votre gestionnaire de tâches !"
while true; do
    afficher_menu
    read option
    case "$option" in
        1) ajouter_tache ;;
        2) supprimer_tache ;;
        3) afficher_taches ;;
        4) echo "Au revoir !"; exit 0 ;;
        *) echo "Option invalide, veuillez réessayer." ;;
    esac
done
