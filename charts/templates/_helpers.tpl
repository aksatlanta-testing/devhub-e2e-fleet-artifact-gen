
{{- define "go-echod85bc9ae-7c7f-4ad1-beec-61bbd270f1c1.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod85bc9ae-7c7f-4ad1-beec-61bbd270f1c1.fullname" -}}
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


{{- define "go-echod85bc9ae-7c7f-4ad1-beec-61bbd270f1c1.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod85bc9ae-7c7f-4ad1-beec-61bbd270f1c1.labels" -}}
helm.sh/chart: {{ include "go-echod85bc9ae-7c7f-4ad1-beec-61bbd270f1c1.chart" . }}
{{ include "go-echod85bc9ae-7c7f-4ad1-beec-61bbd270f1c1.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod85bc9ae-7c7f-4ad1-beec-61bbd270f1c1.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod85bc9ae-7c7f-4ad1-beec-61bbd270f1c1.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}