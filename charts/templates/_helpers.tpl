
{{- define "go-echo700af5a8-b04b-48d9-a8db-65d97c2e3200.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo700af5a8-b04b-48d9-a8db-65d97c2e3200.fullname" -}}
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


{{- define "go-echo700af5a8-b04b-48d9-a8db-65d97c2e3200.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo700af5a8-b04b-48d9-a8db-65d97c2e3200.labels" -}}
helm.sh/chart: {{ include "go-echo700af5a8-b04b-48d9-a8db-65d97c2e3200.chart" . }}
{{ include "go-echo700af5a8-b04b-48d9-a8db-65d97c2e3200.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo700af5a8-b04b-48d9-a8db-65d97c2e3200.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo700af5a8-b04b-48d9-a8db-65d97c2e3200.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}