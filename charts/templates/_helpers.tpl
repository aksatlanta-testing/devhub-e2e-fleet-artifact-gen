
{{- define "go-echoa9c38e3e-2b99-4c7d-8487-1ff0d40422ca.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa9c38e3e-2b99-4c7d-8487-1ff0d40422ca.fullname" -}}
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


{{- define "go-echoa9c38e3e-2b99-4c7d-8487-1ff0d40422ca.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa9c38e3e-2b99-4c7d-8487-1ff0d40422ca.labels" -}}
helm.sh/chart: {{ include "go-echoa9c38e3e-2b99-4c7d-8487-1ff0d40422ca.chart" . }}
{{ include "go-echoa9c38e3e-2b99-4c7d-8487-1ff0d40422ca.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa9c38e3e-2b99-4c7d-8487-1ff0d40422ca.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa9c38e3e-2b99-4c7d-8487-1ff0d40422ca.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}