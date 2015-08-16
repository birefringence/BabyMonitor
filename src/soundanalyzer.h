#ifndef SOUNDANALYZER_H
#define SOUNDANALYZER_H

#include <QObject>
#include <QAudioInput>

class SoundAnalyzer : public QObject
{
    Q_OBJECT
public:
    explicit SoundAnalyzer(QObject *parent = 0);
    virtual ~SoundAnalyzer();


signals:
    void soundLevel(int level, int millis);

public slots:
    void analyze();
//    void testsignal();

private:
//    QAudioInput *audio;
    QScopedPointer< QAudioInput > audio;
    QIODevice *io;
};

#endif // SOUNDANALYZER_H
