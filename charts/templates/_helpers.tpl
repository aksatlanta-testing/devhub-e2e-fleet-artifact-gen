
{{- define "go-echoba6c5804-a2d5-487d-8dcb-0438120d6cfa.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoba6c5804-a2d5-487d-8dcb-0438120d6cfa.fullname" -}}
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


{{- define "go-echoba6c5804-a2d5-487d-8dcb-0438120d6cfa.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoba6c5804-a2d5-487d-8dcb-0438120d6cfa.labels" -}}
helm.sh/chart: {{ include "go-echoba6c5804-a2d5-487d-8dcb-0438120d6cfa.chart" . }}
{{ include "go-echoba6c5804-a2d5-487d-8dcb-0438120d6cfa.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoba6c5804-a2d5-487d-8dcb-0438120d6cfa.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoba6c5804-a2d5-487d-8dcb-0438120d6cfa.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}