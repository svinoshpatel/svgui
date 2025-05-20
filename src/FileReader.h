#ifndef FILEREADER_H
#define FILEREADER_H

#include <QObject>
#include <QString>

class FileReader : public QObject
{
	Q_OBJECT
public:
	explicit FileReader(QObject *parent = nullptr);

	Q_INVOKABLE QString readFile(const QString &filePath);
	Q_INVOKABLE void writeFile(const QString &filePath, const QString &content);
};

#endif
