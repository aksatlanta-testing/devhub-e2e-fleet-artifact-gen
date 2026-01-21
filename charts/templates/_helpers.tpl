
{{- define "go-echoea32905f-009a-4f74-a554-0d7991522e76.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoea32905f-009a-4f74-a554-0d7991522e76.fullname" -}}
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


{{- define "go-echoea32905f-009a-4f74-a554-0d7991522e76.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoea32905f-009a-4f74-a554-0d7991522e76.labels" -}}
helm.sh/chart: {{ include "go-echoea32905f-009a-4f74-a554-0d7991522e76.chart" . }}
{{ include "go-echoea32905f-009a-4f74-a554-0d7991522e76.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoea32905f-009a-4f74-a554-0d7991522e76.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoea32905f-009a-4f74-a554-0d7991522e76.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}