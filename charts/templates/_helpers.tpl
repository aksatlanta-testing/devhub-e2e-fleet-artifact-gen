
{{- define "go-echofd10a573-f7ef-45b3-9a2b-090963e5a88d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofd10a573-f7ef-45b3-9a2b-090963e5a88d.fullname" -}}
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


{{- define "go-echofd10a573-f7ef-45b3-9a2b-090963e5a88d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofd10a573-f7ef-45b3-9a2b-090963e5a88d.labels" -}}
helm.sh/chart: {{ include "go-echofd10a573-f7ef-45b3-9a2b-090963e5a88d.chart" . }}
{{ include "go-echofd10a573-f7ef-45b3-9a2b-090963e5a88d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofd10a573-f7ef-45b3-9a2b-090963e5a88d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofd10a573-f7ef-45b3-9a2b-090963e5a88d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}