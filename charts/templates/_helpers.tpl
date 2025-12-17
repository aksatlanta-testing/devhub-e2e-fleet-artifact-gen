
{{- define "go-echoc639ad03-c066-42e6-ada6-082e3e4e0bff.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc639ad03-c066-42e6-ada6-082e3e4e0bff.fullname" -}}
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


{{- define "go-echoc639ad03-c066-42e6-ada6-082e3e4e0bff.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc639ad03-c066-42e6-ada6-082e3e4e0bff.labels" -}}
helm.sh/chart: {{ include "go-echoc639ad03-c066-42e6-ada6-082e3e4e0bff.chart" . }}
{{ include "go-echoc639ad03-c066-42e6-ada6-082e3e4e0bff.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc639ad03-c066-42e6-ada6-082e3e4e0bff.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc639ad03-c066-42e6-ada6-082e3e4e0bff.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}