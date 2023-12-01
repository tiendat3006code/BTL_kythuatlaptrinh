#include "controller.h"
#include "config.h"

Controller::Controller(QObject *parent)
    : QObject{parent}
{

}

void Controller::serialInit()
{
    port->setPortName(port_name + QString::number(port_count));
    port->setBaudRate(QSerialPort::Baud115200);
    port->setParity(QSerialPort::NoParity);
    port->setDataBits(QSerialPort::Data8);
    port->setFlowControl(QSerialPort::NoFlowControl);
    port->setStopBits(QSerialPort::OneStop);

    if(!port->open(QIODevice::ReadWrite)){
        qInfo()<<port->errorString();
        port_count ++;
        serialInit();
    }
    else{
        qInfo()<<"OPEN PORT SUCCESS";
    }
}

void Controller::serialRead()
{
    if(port->isOpen()){
        qInfo()<<"PORT IS OPEN";
        connect(port, &QSerialPort::readyRead, this, &Controller::handleData);
    }
}

void Controller::controlcar(int status)
{
    switch (status) {
    case FORWARD:
        sendDataControl('f');
        break;
    case BACKWARD:
        sendDataControl('b');
        break;
    case STOP:
        sendDataControl('s');
        break;
    case RIGHT:
        sendDataControl('r');
        break;
    case LEFT:
        sendDataControl('l');
        break;
    default:
        break;
    }
}

void Controller::handleData()
{
    RxBuffer.append(port->readAll());
    if(RxBuffer.length() >= 4){
        qInfo()<<RxBuffer.toInt();
        RxBuffer.clear();
        port->clear();
    }
}

void Controller::sendDataControl(QChar c)
{
    QByteArray arrayToSend;
    arrayToSend.append(c);
    port->write(arrayToSend);
    port->flush();
    port->waitForBytesWritten(5);
    port->clear();
}
