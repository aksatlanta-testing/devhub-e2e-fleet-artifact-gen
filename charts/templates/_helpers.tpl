
{{- define "go-echo208ece03-e700-42bc-8fc8-b7dcf4c1f7ae.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo208ece03-e700-42bc-8fc8-b7dcf4c1f7ae.fullname" -}}
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


{{- define "go-echo208ece03-e700-42bc-8fc8-b7dcf4c1f7ae.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo208ece03-e700-42bc-8fc8-b7dcf4c1f7ae.labels" -}}
helm.sh/chart: {{ include "go-echo208ece03-e700-42bc-8fc8-b7dcf4c1f7ae.chart" . }}
{{ include "go-echo208ece03-e700-42bc-8fc8-b7dcf4c1f7ae.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo208ece03-e700-42bc-8fc8-b7dcf4c1f7ae.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo208ece03-e700-42bc-8fc8-b7dcf4c1f7ae.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}