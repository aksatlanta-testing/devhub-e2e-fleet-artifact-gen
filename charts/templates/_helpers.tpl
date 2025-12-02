
{{- define "go-echobb3fee5d-e074-408e-9285-581a79811551.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobb3fee5d-e074-408e-9285-581a79811551.fullname" -}}
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


{{- define "go-echobb3fee5d-e074-408e-9285-581a79811551.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobb3fee5d-e074-408e-9285-581a79811551.labels" -}}
helm.sh/chart: {{ include "go-echobb3fee5d-e074-408e-9285-581a79811551.chart" . }}
{{ include "go-echobb3fee5d-e074-408e-9285-581a79811551.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobb3fee5d-e074-408e-9285-581a79811551.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobb3fee5d-e074-408e-9285-581a79811551.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}