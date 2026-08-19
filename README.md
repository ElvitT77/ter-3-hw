# ter-3-hw

## Задание 1

    Изучите проект.
    Инициализируйте проект, выполните код.

Приложите скриншот входящих правил «Группы безопасности» в ЛК Yandex Cloud .

## Решение:

<img width="974" height="527" alt="изображение" src="https://github.com/user-attachments/assets/bc1c8e9d-9bbb-4bd9-b595-c264988d59f8" />

<img width="974" height="521" alt="изображение" src="https://github.com/user-attachments/assets/ab40e3ae-161d-43f1-9103-048be3bdb0c9" />

<img width="974" height="566" alt="изображение" src="https://github.com/user-attachments/assets/a4a62f86-29cc-4e84-870f-f3ea2db43ae2" />

## Задание 2

    Создайте файл count-vm.tf. Опишите в нём создание двух одинаковых ВМ web-1 и web-2 (не web-0 и web-1) с минимальными параметрами, используя мета-аргумент count loop. Назначьте ВМ созданную в первом задании группу безопасности.(как это сделать узнайте в документации провайдера yandex/compute_instance )
    Создайте файл for_each-vm.tf. Опишите в нём создание двух ВМ для баз данных с именами "main" и "replica" разных по cpu/ram/disk_volume , используя мета-аргумент for_each loop. Используйте для обеих ВМ одну общую переменную типа:

variable "each_vm" {
  type = list(object({  vm_name=string, cpu=number, ram=number, disk_volume=number }))
}

При желании внесите в переменную все возможные параметры. 3. ВМ, описанные в файле count-vm.tf, должны создаваться после ВМ, описанных в файле for_each-vm.tf. 4. Используйте функцию file в local-переменной для считывания ключа ~/.ssh/id_rsa.pub и его последующего использования в блоке metadata, взятому из ДЗ 2. 5. Инициализируйте проект, выполните код.

## Решение:

<img width="974" height="401" alt="изображение" src="https://github.com/user-attachments/assets/0f663847-8cdc-469f-8943-08adf0f6fba2" />

<img width="974" height="427" alt="изображение" src="https://github.com/user-attachments/assets/66e11eae-bbac-42d9-b0f3-18b0d687ea45" />

## Задание 3

    Создайте 3 одинаковых виртуальных диска размером 1 Гб с помощью ресурса yandex_compute_disk и мета-аргумента count в файле disk_vm.tf .
    Создайте в том же файле одиночную(использовать count или for_each запрещено из-за задания №4) ВМ c именем "storage" . Используйте блок dynamic secondary_disk{..} и мета-аргумент for_each для подключения созданных вами дополнительных дисков.

## Решение:

<img width="974" height="457" alt="изображение" src="https://github.com/user-attachments/assets/b7ab2dcc-17b7-4380-ba42-0610d2013780" />

## Задание 4

    В файле ansible.tf создайте inventory-файл для ansible. Используйте функцию tepmplatefile и файл-шаблон для создания ansible inventory-файла из лекции. Готовый код возьмите из демонстрации к лекции demonstration2. Передайте в него в качестве переменных группы виртуальных машин из задания 2.1, 2.2 и 3.2, т. е. 5 ВМ.
    Инвентарь должен содержать 3 группы и быть динамическим, т. е. обработать как группу из 2-х ВМ, так и 999 ВМ.
    Добавьте в инвентарь переменную fqdn.

[webservers]
web-1 ansible_host=<внешний ip-адрес> fqdn=<полное доменное имя виртуальной машины>
web-2 ansible_host=<внешний ip-адрес> fqdn=<полное доменное имя виртуальной машины>

[databases]
main ansible_host=<внешний ip-адрес> fqdn=<полное доменное имя виртуальной машины>
replica ansible_host<внешний ip-адрес> fqdn=<полное доменное имя виртуальной машины>

[storage]
storage ansible_host=<внешний ip-адрес> fqdn=<полное доменное имя виртуальной машины>

Пример fqdn: web1.ru-central1.internal(в случае указания переменной hostname(не путать с переменной name)); fhm8k1oojmm5lie8i22a.auto.internal(в случае отсутвия перменной hostname - автоматическая генерация имени, зона изменяется на auto). нужную вам переменную найдите в документации провайдера или terraform console. 4. Выполните код. Приложите скриншот получившегося файла.

Для общего зачёта создайте в вашем GitHub-репозитории новую ветку terraform-03. Закоммитьте в эту ветку свой финальный код проекта, пришлите ссылку на коммит.
Удалите все созданные ресурсы.

## Решение:

<img width="974" height="375" alt="изображение" src="https://github.com/user-attachments/assets/3d849c2f-386a-440a-b9ab-c031d769518b" />

<img width="974" height="1004" alt="изображение" src="https://github.com/user-attachments/assets/6dde5211-8384-4450-8101-3860099f558b" />

