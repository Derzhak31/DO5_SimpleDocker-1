#include <fcgiapp.h>
#include <stdio.h>

int main() {
  FCGX_Init();  // Инициализируем библиотеку

  FCGX_Request req;  // Данные, которые нужно инициализировать

  FCGX_InitRequest(&req, 0, 0);  // Инициализация структуры запроса

  while (FCGX_Accept_r(&req) >= 0) {  // Получаем новый запрос (в случае ошибки
                                      // возвращается значение меньше 0)
    FCGX_FPrintF(req.out,
                 "Content-Type: text/html\n\n "
                 "<h1>Hello World!</h1>");
    FCGX_Finish_r(&req);  // Закрываем соединение
  }

  return 0;
}