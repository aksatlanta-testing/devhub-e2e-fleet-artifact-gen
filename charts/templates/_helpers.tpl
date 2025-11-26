
{{- define "go-echoa025203c-c2dd-4b27-927f-1b86cb02437c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa025203c-c2dd-4b27-927f-1b86cb02437c.fullname" -}}
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


{{- define "go-echoa025203c-c2dd-4b27-927f-1b86cb02437c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa025203c-c2dd-4b27-927f-1b86cb02437c.labels" -}}
helm.sh/chart: {{ include "go-echoa025203c-c2dd-4b27-927f-1b86cb02437c.chart" . }}
{{ include "go-echoa025203c-c2dd-4b27-927f-1b86cb02437c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa025203c-c2dd-4b27-927f-1b86cb02437c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa025203c-c2dd-4b27-927f-1b86cb02437c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}