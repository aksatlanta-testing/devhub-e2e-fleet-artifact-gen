
{{- define "go-echobc704a08-192d-4e29-94cf-63e4608d4248.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobc704a08-192d-4e29-94cf-63e4608d4248.fullname" -}}
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


{{- define "go-echobc704a08-192d-4e29-94cf-63e4608d4248.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobc704a08-192d-4e29-94cf-63e4608d4248.labels" -}}
helm.sh/chart: {{ include "go-echobc704a08-192d-4e29-94cf-63e4608d4248.chart" . }}
{{ include "go-echobc704a08-192d-4e29-94cf-63e4608d4248.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobc704a08-192d-4e29-94cf-63e4608d4248.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobc704a08-192d-4e29-94cf-63e4608d4248.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}