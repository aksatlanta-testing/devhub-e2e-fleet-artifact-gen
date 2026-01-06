
{{- define "go-echo6d52ec42-d6f0-476a-970e-502eeb437cdb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6d52ec42-d6f0-476a-970e-502eeb437cdb.fullname" -}}
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


{{- define "go-echo6d52ec42-d6f0-476a-970e-502eeb437cdb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6d52ec42-d6f0-476a-970e-502eeb437cdb.labels" -}}
helm.sh/chart: {{ include "go-echo6d52ec42-d6f0-476a-970e-502eeb437cdb.chart" . }}
{{ include "go-echo6d52ec42-d6f0-476a-970e-502eeb437cdb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6d52ec42-d6f0-476a-970e-502eeb437cdb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6d52ec42-d6f0-476a-970e-502eeb437cdb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}