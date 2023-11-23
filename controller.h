#ifndef CONTROLLER_H
#define CONTROLLER_H

#include <QObject>
#include <QDebug>
#include <QByteArray>
#include <QIODevice>
#include <QSerialPort>
#include <QThread>
#include <QString>

class Controller : public QObject
{
    Q_OBJECT
public:
    explicit Controller(QObject *parent = nullptr);

signals:
private:
    QSerialPort* port = new QSerialPort(this);
    QByteArray TxBuffer;
    QByteArray RxBuffer;
    QString port_name = "/dev/ttyUSB";
    int port_count = 0;
public slots:
    void serialInit();
    void serialRead();
private slots:
    void handleData();
};

#endif // CONTROLLER_H
