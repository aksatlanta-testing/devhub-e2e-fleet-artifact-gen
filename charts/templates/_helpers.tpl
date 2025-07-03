
{{- define "go-echo8c1ad366-4874-4d2f-9b86-313603dc1cca.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8c1ad366-4874-4d2f-9b86-313603dc1cca.fullname" -}}
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


{{- define "go-echo8c1ad366-4874-4d2f-9b86-313603dc1cca.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8c1ad366-4874-4d2f-9b86-313603dc1cca.labels" -}}
helm.sh/chart: {{ include "go-echo8c1ad366-4874-4d2f-9b86-313603dc1cca.chart" . }}
{{ include "go-echo8c1ad366-4874-4d2f-9b86-313603dc1cca.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo8c1ad366-4874-4d2f-9b86-313603dc1cca.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo8c1ad366-4874-4d2f-9b86-313603dc1cca.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}