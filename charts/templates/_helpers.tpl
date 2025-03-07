
{{- define "go-echo0594fb7e-dc0e-4d6d-a58a-d067aeaf39ef.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0594fb7e-dc0e-4d6d-a58a-d067aeaf39ef.fullname" -}}
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


{{- define "go-echo0594fb7e-dc0e-4d6d-a58a-d067aeaf39ef.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0594fb7e-dc0e-4d6d-a58a-d067aeaf39ef.labels" -}}
helm.sh/chart: {{ include "go-echo0594fb7e-dc0e-4d6d-a58a-d067aeaf39ef.chart" . }}
{{ include "go-echo0594fb7e-dc0e-4d6d-a58a-d067aeaf39ef.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo0594fb7e-dc0e-4d6d-a58a-d067aeaf39ef.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo0594fb7e-dc0e-4d6d-a58a-d067aeaf39ef.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}