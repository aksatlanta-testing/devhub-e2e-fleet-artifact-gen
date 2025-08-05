
{{- define "go-echocb4f8235-83ae-4dfd-9a86-87f462db1afa.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocb4f8235-83ae-4dfd-9a86-87f462db1afa.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echocb4f8235-83ae-4dfd-9a86-87f462db1afa.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocb4f8235-83ae-4dfd-9a86-87f462db1afa.labels" -}}
helm.sh/chart: {{ include "go-echocb4f8235-83ae-4dfd-9a86-87f462db1afa.chart" . }}
{{ include "go-echocb4f8235-83ae-4dfd-9a86-87f462db1afa.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocb4f8235-83ae-4dfd-9a86-87f462db1afa.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocb4f8235-83ae-4dfd-9a86-87f462db1afa.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}