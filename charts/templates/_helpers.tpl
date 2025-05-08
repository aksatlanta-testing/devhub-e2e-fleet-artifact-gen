
{{- define "go-echo8d08797e-447f-4982-ba8c-c02ef3f4419c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8d08797e-447f-4982-ba8c-c02ef3f4419c.fullname" -}}
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


{{- define "go-echo8d08797e-447f-4982-ba8c-c02ef3f4419c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8d08797e-447f-4982-ba8c-c02ef3f4419c.labels" -}}
helm.sh/chart: {{ include "go-echo8d08797e-447f-4982-ba8c-c02ef3f4419c.chart" . }}
{{ include "go-echo8d08797e-447f-4982-ba8c-c02ef3f4419c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo8d08797e-447f-4982-ba8c-c02ef3f4419c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo8d08797e-447f-4982-ba8c-c02ef3f4419c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}