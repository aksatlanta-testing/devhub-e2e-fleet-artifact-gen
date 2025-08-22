
{{- define "go-echo79c2c06e-9920-49a9-a661-a4537dee872d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo79c2c06e-9920-49a9-a661-a4537dee872d.fullname" -}}
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


{{- define "go-echo79c2c06e-9920-49a9-a661-a4537dee872d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo79c2c06e-9920-49a9-a661-a4537dee872d.labels" -}}
helm.sh/chart: {{ include "go-echo79c2c06e-9920-49a9-a661-a4537dee872d.chart" . }}
{{ include "go-echo79c2c06e-9920-49a9-a661-a4537dee872d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo79c2c06e-9920-49a9-a661-a4537dee872d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo79c2c06e-9920-49a9-a661-a4537dee872d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}