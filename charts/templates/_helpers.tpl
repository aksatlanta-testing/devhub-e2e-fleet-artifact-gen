
{{- define "go-echocc1e3799-727c-40b5-9257-d46d5a11e1be.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocc1e3799-727c-40b5-9257-d46d5a11e1be.fullname" -}}
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


{{- define "go-echocc1e3799-727c-40b5-9257-d46d5a11e1be.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocc1e3799-727c-40b5-9257-d46d5a11e1be.labels" -}}
helm.sh/chart: {{ include "go-echocc1e3799-727c-40b5-9257-d46d5a11e1be.chart" . }}
{{ include "go-echocc1e3799-727c-40b5-9257-d46d5a11e1be.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocc1e3799-727c-40b5-9257-d46d5a11e1be.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocc1e3799-727c-40b5-9257-d46d5a11e1be.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}