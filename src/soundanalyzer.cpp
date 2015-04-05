#include <QAudioInput>
#include <QDebug>

#include "soundanalyzer.h"

SoundAnalyzer::SoundAnalyzer(QObject *parent) :
    QObject(parent)
{
    QAudioFormat af;

    af.setSampleRate(8000);
    af.setChannelCount(1);
    af.setSampleSize(8);
    af.setCodec("audio/pcm");
    af.setByteOrder(QAudioFormat::LittleEndian);
    af.setSampleType(QAudioFormat::UnSignedInt);

    QAudioDeviceInfo info(QAudioDeviceInfo::defaultInputDevice());

    qDebug() << "Device: " << info.deviceName();

//    af = info.nearestFormat(af);
//    qDebug() << "Sample Rate   " << af.sampleRate();
//    qDebug() << "Channel Count " << af.channelCount();
//    qDebug() << "Sample Size   " << af.sampleSize();
//    qDebug() << "Codec         " << af.codec();
//    qDebug() << "Byte Order    " << af.byteOrder();
//    qDebug() << "Sample Type   " << af.sampleType();

    audio.reset(new QAudioInput(info, af, this));

    io = audio->start();
//    audio->setNotifyInterval(500);
//    connect(audio.data(), SIGNAL(notify()), this, SLOT(analyze()));
    connect(io, SIGNAL(readyRead()), this, SLOT(analyze()));
//    qDebug() << "result: " << audio->error();
}

void SoundAnalyzer::testsignal()
{
//    qDebug() << "Input";
//    QList<QAudioDeviceInfo> list = QAudioDeviceInfo::availableDevices(QAudio::AudioInput);

//    for (int i = 0; i < list.size(); ++i) {
//        qDebug() << list[i].deviceName();
//    }
//    qDebug() << "Output";
//    list = QAudioDeviceInfo::availableDevices(QAudio::AudioOutput);

//    for (int i = 0; i < list.size(); ++i) {
//        qDebug() << list[i].deviceName();
//    }
    qDebug() << "State " << audio->state();
}

void SoundAnalyzer::analyze()
{
    if (io) {
        int i = audio->bytesReady();
        if (i > 0) {
            QByteArray buffer = io->read(i);
            int sum = 0;
            for (int j = 0; j < buffer.size(); j++) {
                sum += abs(buffer[j] - 127);
            }
//            qDebug() << "Sum:" << sum / i;
            emit soundLevel(sum/i, i/8);
        }
    }
}

SoundAnalyzer::~SoundAnalyzer()
{
    audio->stop();
}
