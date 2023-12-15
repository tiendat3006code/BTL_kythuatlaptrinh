#ifndef CONTROLLER_H
#define CONTROLLER_H

#include <QObject>
#include <QDebug>
#include <QByteArray>
#include <QIODevice>
#include <QSerialPort>
#include <QThread>
#include <QString>
#include <QChar>
#include <qqml.h>
#include <QtQml/QtQml>
#include <QList>
#include "config.h"


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
    int sensorResult;
    QList<int> result;
public slots:
    //Cai dat cac thong so ban dau cho cong COM
    void serialInit();
    //Xu ly tin hieu tu cong COM
    void serialRead();
    //Dieu khien xe bang cach gui data da duoc package tu sendDataControl
    void controlCar(int status);
    //Cai dat xung PWM tren xe
    void setPower(int power);
    //Lay gia tri cam bien duoc gui ve tu xe
    int getSensorResult();
private slots:
    //Xu ly du lieu nhan duoc tu ham serialRead
    void handleData();
    //Packdata de chuan bi gui den cong COM
    void sendDataControl(QChar c);
};

#endif // CONTROLLER_H
