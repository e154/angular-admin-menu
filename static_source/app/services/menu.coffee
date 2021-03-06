angular
.module('appServices')
.constant('mainMenuTree', [
    {
      name: "Сотрудники"
      icon: "fa fa-users"
      children: [
        {
          name: "Должности"
          permission: "manage_positions"
          sref: "positions"
        }
        {
          name: "Сотрудники"
          sref: "employees"
          permission: "manage_employees"
          children: [
            {
              name: "Сотрудник 1"
              permission: "manage_positions"
            }
            {
              name: "Сотрудник 2"
              permission: "manage_employees"
              children: [
                {
                  name: "Сотрудник 2.1"
                  permission: "manage_positions"
                }
                {
                  name: "Сотрудник 2.2"
                  permission: "manage_employees"
                  children: [
                    {
                      name: "Сотрудник 2.2.1"
                      permission: "manage_positions"
                    }
                    {
                      name: "Сотрудник 2.2.2"
                      permission: "manage_employees"
                    }
                  ]
                }
              ]
            }
          ]
        }
      ]
    }
    {
      name: "Интерфейс Конфигуратора"
      icon: "fa fa-object-group"
      children: [
        {
          name: "Скины"
          sref : "skins"
          permission: "manage_skins"
        }
        {
          name: "Графика"
          sref : "icons"
          permission: "manage_icons"
          children: []
        }
        {
          name: "Языковые пакеты"
          sref : "language_packs"
          permission: "manage_language_packs"
        }
      ]
    }
    {
      name: "Валюта"
      icon: "fa fa-btc"
      children: [
        {
          name: "Список валют"
          sref : "currencies"
          permission: "manage_currencies"
        }
        {
          name: "Курсы валют"
          sref : "currency_books"
          permission: "manage_currencies"
        }
      ]
    }
  ]
)
