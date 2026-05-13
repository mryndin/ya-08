## 📋 Анализ существующего REST API

### Текущие эндпоинты:

Метод

Путь

Описание

Возвращаемые данные

`GET`

`/clients/{id}`

Получить клиента по ID

`Client`: id, name, age

`GET`

`/clients/{id}/documents`

Документы клиента

`Document[]`: id, type, number, issueDate, expiryDate

`GET`

`/clients/{id}/relatives`

Родственники клиента

`Relative[]`: id, relationType, name, age

### Проблемы REST-подхода:

-   ❌ **Over-fetching**: при запросе `/clients/{id}` нельзя выбрать только нужные поля
-   ❌ **Under-fetching**: для получения клиента + документов нужно 2 отдельных запроса
-   ❌ **N+1 проблема**: каждый вложенный ресурс — отдельный HTTP-запрос
-   ❌ **Жёсткая структура**: сложно адаптировать под разные сценарии использования