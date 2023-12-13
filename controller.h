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
    void serialInit();
    void serialRead();
    void controlCar(int status);
    void setPower(int power);
    int getSensorResult();
private slots:
    void handleData();
    void sendDataControl(QChar c);
};

#endif // CONTROLLER_H
