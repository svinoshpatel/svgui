#include "FileReader.h"
#include <QFile>
#include <QUrl>
#include <QTextStream>

FileReader::FileReader(QObject *parent) : QObject(parent) {}

QString FileReader::readFile(const QString &filePath)
{
	QUrl url(filePath);
	QString localPath = url.toLocalFile();
	
	QFile file(localPath);
	if (!file.open(QIODevice::ReadOnly | QIODevice::Text))
		return QString("Error opening file");

	QTextStream in(&file);
	return in.readAll();
};

void FileReader::writeFile(const QString &filePath, const QString &content)
{
	QUrl url(filePath);
	QString localPath = url.toLocalFile();

	QFile file(localPath);
	if (!file.open(QIODevice::WriteOnly | QIODevice::Text))
		return;

	QTextStream out(&file);
	out << content;
};
