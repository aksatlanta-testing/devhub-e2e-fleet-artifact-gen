
{{- define "go-echof81b0037-e7c1-4cfd-921c-1855fae8599b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof81b0037-e7c1-4cfd-921c-1855fae8599b.fullname" -}}
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


{{- define "go-echof81b0037-e7c1-4cfd-921c-1855fae8599b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof81b0037-e7c1-4cfd-921c-1855fae8599b.labels" -}}
helm.sh/chart: {{ include "go-echof81b0037-e7c1-4cfd-921c-1855fae8599b.chart" . }}
{{ include "go-echof81b0037-e7c1-4cfd-921c-1855fae8599b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof81b0037-e7c1-4cfd-921c-1855fae8599b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof81b0037-e7c1-4cfd-921c-1855fae8599b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}