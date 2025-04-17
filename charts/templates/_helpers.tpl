
{{- define "go-echo8042f35e-dfae-496e-b2e7-a9cefbade8cc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8042f35e-dfae-496e-b2e7-a9cefbade8cc.fullname" -}}
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


{{- define "go-echo8042f35e-dfae-496e-b2e7-a9cefbade8cc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8042f35e-dfae-496e-b2e7-a9cefbade8cc.labels" -}}
helm.sh/chart: {{ include "go-echo8042f35e-dfae-496e-b2e7-a9cefbade8cc.chart" . }}
{{ include "go-echo8042f35e-dfae-496e-b2e7-a9cefbade8cc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo8042f35e-dfae-496e-b2e7-a9cefbade8cc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo8042f35e-dfae-496e-b2e7-a9cefbade8cc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}